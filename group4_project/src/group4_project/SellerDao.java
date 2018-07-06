package group4_project;
import group4_project.Seller;
import connDB.DriverDB;
import java.sql.*;
import java.util.ArrayList;

public class SellerDao {
	
	//searchList 총페이지 갯수 구하는 메서드입니다.
	public int SearchpagePerRow(int rowPerPage) {
		
		PreparedStatement preparedStatement = null;
		Connection connection = null;
		ResultSet resultSet = null;
		int totalPage = 0;
		int listPage = 0;
		DriverDB driverDb = new DriverDB();
		
		try {
			connection = driverDb.driverDbcon();
			String totalPageQuery = "SELECT COUNT(sell_code) AS sellCode FROM seller";
			preparedStatement = connection.prepareStatement(totalPageQuery);
			
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				totalPage = resultSet.getInt("sellCode");
			}
			listPage = totalPage / rowPerPage;
			
			if(totalPage % rowPerPage != 0) {
				listPage++;
			}
			
		}catch(SQLException close) {
			close.printStackTrace();
		}finally {
			if(resultSet != null)
				try {
					resultSet.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
			if(preparedStatement != null)
				try{
				preparedStatement.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
			if(connection != null)
				try {
					connection.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
	
		}
		
		return listPage;
	}
	
	
	//검색 기능관련된 메서드입니다
	public ArrayList<Seller> SelectSearchList(String title ,String sellSearch ,int begin ,int rowPerPage) {
		
		PreparedStatement preparedStatement = null;
		Connection connection = null;
		ResultSet resultSet = null;
		Seller seller = null;
		ArrayList<Seller> totalSearch = null;
		DriverDB driverDb = new DriverDB();
		String selectQuery = null;
		try {
			connection = driverDb.driverDbcon();
			
			if(title.equals("음식이름")) {
				 selectQuery = "SELECT sell_name ,sell_menu ,sell_price ,sell_address FROM seller WHERE sell_menu LIKE ? LIMIT ? ,?";
				
				
			}else if(title.equals("가게이름")) {
				 selectQuery = "SELECT sell_name ,sell_menu ,sell_price ,sell_address FROM seller WHERE sell_name LIKE ? LIMIT ? ,?";
				
				
			}else if(title.equals("주소")) {
				 selectQuery = "SELECT sell_name ,sell_menu ,sell_price ,sell_address FROM seller WHERE sell_address LIKE ? LIMIT ? ,?";
				
			}
			
				preparedStatement = connection.prepareStatement(selectQuery);
				preparedStatement.setString(1, "%"+sellSearch+"%");
				preparedStatement.setInt(2, begin);
				preparedStatement.setInt(3, rowPerPage);
			resultSet = preparedStatement.executeQuery();
			
			totalSearch = new ArrayList<Seller>();
			if(resultSet.next()) {
				seller = new Seller();
				seller.setSellName(resultSet.getString("sell_name"));
				seller.setSellMenu(resultSet.getString("sell_menu"));
				seller.setSellPrice(resultSet.getString("sell_price"));
				seller.setSellAddress(resultSet.getString("sell_address"));
				totalSearch.add(seller);
			}
			
			
		}catch(SQLException close) {
			close.printStackTrace();
		}finally {
			if(resultSet != null) 
				try {
					resultSet.close();
				}catch(SQLException close) {
					
				}
			
			if(preparedStatement != null) 
				try {
					preparedStatement.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
			
			if(connection != null)
				try {
					connection.close();
				}catch(SQLException close) {
					
				}
		}
		
		return totalSearch;
	}
	
	//삭제 처리하기 위한 메서드입니다
	public String deleteSellerSelect(String memberId ,String memberPass ,int sellCode) {
		
		PreparedStatement preparedStatementSelect = null;
		PreparedStatement preparedStatementDelete = null;
		Connection connection = null;
		ResultSet resultSetSelect = null;
		String deleteCheck = null;
		DriverDB driverDb = new DriverDB();
		
		try {
			connection = driverDb.driverDbcon();
			
			String SelectQuery = "SELECT member_pw FROM member WHERE member_id=? ";
			preparedStatementSelect = connection.prepareStatement(SelectQuery);
			preparedStatementSelect.setString(1, memberId);
			
			resultSetSelect = preparedStatementSelect.executeQuery();
			
			if(resultSetSelect.next()) {
				System.out.println("아이디 일치");
				if(memberPass.equals(resultSetSelect.getString("member_pw"))) {
					System.out.println("삭제 실행");
					String deleteQuery = "DELETE FROM seller WHERE sell_code=?";
					preparedStatementDelete = connection.prepareStatement(deleteQuery);
					preparedStatementDelete.setInt(1, sellCode);
					
					preparedStatementDelete.executeUpdate();
					
					deleteCheck = "삭제 실행";
				}else {
					System.out.println("패스워드 실패");
					
					deleteCheck = "패스워드 실패";
				}
			}
			
		}catch(SQLException close) {
			close.printStackTrace();
		}finally {
			if(resultSetSelect != null)
				try {
					resultSetSelect.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
			if(preparedStatementSelect != null)
				try {
					preparedStatementSelect.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
			if(preparedStatementDelete != null)
				try {
					preparedStatementDelete.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
			if(connection != null)
				try {
					connection.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
		}
		return deleteCheck;
	}
	
	//클릭한 리스트 상제 정보를 불러오기 위한 메서드 입니다.
	public Seller detailSellerSelect() {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		DriverDB driverDb = new DriverDB();
		Seller seller = null;
		
		connection = driverDb.driverDbcon();
		//driverDb변수를 이용해 드라이브 로딩과 연결을 시켜줬습니다.
		
		try {
			String selectQuery = "SELECT sell_code ,member_id ,sell_name ,sell_address ,sell_category ,sell_menu ,sell_price ,sell_date ,sell_content FROM seller";
			preparedStatement = connection.prepareStatement(selectQuery);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				seller = new Seller();
				seller.setSellCode(resultSet.getInt("sell_code"));
				seller.setMemberId(resultSet.getString("member_id"));
				seller.setSellName(resultSet.getString("sell_name"));
				seller.setSellAddress(resultSet.getString("sell_address"));
				seller.setSellCategory(resultSet.getString("sell_menu"));
				seller.setSellPrice(resultSet.getString("sell_price"));
				seller.setSellDate(resultSet.getString("sell_date"));
				seller.setSellContent(resultSet.getString("sell_content"));
			}
		}catch(SQLException close) {
			close.printStackTrace();
		}finally {
			if(resultSet != null)
				try {
					resultSet.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
			if(preparedStatement != null)
				try{
				preparedStatement.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
			if(connection != null)
				try {
					connection.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
	
		}
		
		return seller;
	}
	
	//list총페이지 갯수 구하는 메서드입니다
	public int pagePerRow(int rowPerPage) {
		
		PreparedStatement preparedStatement = null;
		Connection connection = null;
		ResultSet resultSet = null;
		int totalPage = 0;
		int listPage = 0;
		DriverDB driverDb = new DriverDB();
		
		try {
			connection = driverDb.driverDbcon();
			String totalPageQuery = "SELECT COUNT(sell_code) AS sellCode FROM seller";
			preparedStatement = connection.prepareStatement(totalPageQuery);
			
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				totalPage = resultSet.getInt("sellCode");
			}
			listPage = totalPage / rowPerPage;
			
			if(totalPage % rowPerPage != 0) {
				listPage++;
			}
			
		}catch(SQLException close) {
			close.printStackTrace();
		}finally {
			if(resultSet != null)
				try {
					resultSet.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
			if(preparedStatement != null)
				try{
				preparedStatement.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
			if(connection != null)
				try {
					connection.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
	
		}
		
		return listPage;
	}
	
	//상품 메뉴리스트에 쓰이는 Select메서드입니다
	public ArrayList<Seller> listSellerSelect(int begin ,int rowPerPage) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//클래스 타입으로 변수를 선언 시켜준다음 null값으로 설정 해줬습니다
		
		DriverDB driverDb = new DriverDB();
		ArrayList<Seller> totalList = new ArrayList<Seller>();

		connection = driverDb.driverDbcon();
		//driverDb변수에 들어있는 주소값으로 찾아가 driverDbcon()메서드를 실행을 해 드아비르 로딩 or 드라이브 연결을 시켜줬습니다
		try {
			String selectQuery = "SELECT sell_code ,sell_name ,sell_address ,sell_price ,sell_menu FROM seller ORDER BY sell_code DESC LIMIT ? ,?";
			preparedStatement = connection.prepareStatement(selectQuery);
			preparedStatement.setInt(1, begin);
			preparedStatement.setInt(2, rowPerPage);
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Seller seller = new Seller();
				seller.setSellCode(resultSet.getInt("sell_code"));
				seller.setSellName(resultSet.getString("sell_name"));
				seller.setSellAddress(resultSet.getString("sell_address"));
				seller.setSellPrice(resultSet.getString("sell_price"));
				seller.setSellMenu(resultSet.getString("sell_menu"));
				totalList.add(seller);
			}
		}catch(SQLException close) {
			close.printStackTrace();
		}finally {
			if(resultSet != null)
				try {
					resultSet.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
			if(preparedStatement != null)
				try{
				preparedStatement.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
			if(connection != null)
				try {
					connection.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
	
		}
		return totalList;
	}
	
	//update에 쓰이는 메서드입니다
		public void updateSeller(Seller seller) {
			
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			DriverDB driverDb = new DriverDB();
			
			connection = driverDb.driverDbcon();
			try {
				String updateQuery = "UPDATE seller SET sell_name=? ,sell_menu=? ,sell_price=? ,sell_address=? ,sell_content=? ,sell_category=? WHERE sell_code=?";
				preparedStatement = connection.prepareStatement(updateQuery);
				preparedStatement.setString(1, seller.getSellName());
				preparedStatement.setString(2, seller.getSellMenu());
				preparedStatement.setString(3, seller.getSellPrice());
				preparedStatement.setString(4, seller.getSellAddress());
				preparedStatement.setString(5, seller.getSellContent());
				preparedStatement.setString(6, seller.getSellCategory());
				preparedStatement.setInt(7, seller.getSellCode());
				
				preparedStatement.executeUpdate();
				
			}catch(SQLException close) {
				close.printStackTrace();
			}finally {
				if(preparedStatement != null) 
					try {
					preparedStatement.close();
					}catch(SQLException close) {
						close.printStackTrace();
					}
				if(connection != null) 
					try {
						connection.close();
					}catch(SQLException close) {
						close.printStackTrace();
					}
			}
		}
	
	//수정 처리 화면에 저장된 값을 나오게 할 Select메서드입니다
	public Seller updateSellerSelect(int sellCode) {
		Seller seller = new Seller();
		DriverDB driverDb = new DriverDB();
		
		PreparedStatement preparedStatement = null;
		Connection connection = null;
		ResultSet resultSet = null;
		//클래스 타입으로 변수를 설정 후 null값으로 넣어줬습니다
		connection = driverDb.driverDbcon();
		//driverDb 변수안에 있는 주소값을 찾아가 driverDbcon()메서드를 실행을 해 my-sql연결을 시켜줬습니다. 
		
		try {
			String SelectQuery = "SELECT sell_code ,sell_name ,sell_address ,sell_price ,sell_content ,sell_category ,sell_menu FROM seller WHERE sell_code=?";
			preparedStatement = connection.prepareStatement(SelectQuery);
			preparedStatement.setInt(1, sellCode);
			//Query실행 하기 위해 Query문 대입 했습니다
			resultSet = preparedStatement.executeQuery();
			//Query문 실행
			
			if(resultSet.next()) {
				seller.setSellCode(resultSet.getInt("sell_code"));
				seller.setSellName(resultSet.getString("sell_name"));
				seller.setSellAddress(resultSet.getString("sell_address"));
				seller.setSellPrice(resultSet.getString("sell_price"));
				seller.setSellContent(resultSet.getString("sell_content"));
				seller.setSellCategory(resultSet.getString("sell_category"));
				seller.setSellMenu(resultSet.getString("sell_menu"));
			}
		}catch(SQLException close) {
			close.printStackTrace();
		}finally {
			if(preparedStatement != null)
				try {
					preparedStatement.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
			if(connection != null)
				try {
					connection.close();
				}catch(SQLException close) {
					close.printStackTrace();
				}
		}
		return seller;
	}
	
	//상품 등록을 하기 위한 메서드입니다.
	public void insertSeller(Seller seller) {
		
		PreparedStatement preparedStatement = null;
		Connection connection = null;
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDbcon();
		
		try {
			String insertQuery = "INSERT INTO seller(member_id ,sell_name ,sell_address ,sell_category ,sell_menu ,sell_price ,sell_date ,sell_content) VALUES(? ,? ,? ,? ,? ,? ,now() ,?)";
			preparedStatement = connection.prepareStatement(insertQuery);
			preparedStatement.setString(1, seller.getMemberId());
			preparedStatement.setString(2, seller.getSellName());
			preparedStatement.setString(3, seller.getSellAddress());
			preparedStatement.setString(4, seller.getSellCategory());
			preparedStatement.setString(5, seller.getSellMenu());
			preparedStatement.setString(6, seller.getSellPrice());
			preparedStatement.setString(7, seller.getSellContent());
			System.out.println(preparedStatement +"<- preparedStatement");
			
			preparedStatement.executeUpdate();
		}catch(SQLException close) {
			close.printStackTrace();
		}finally {
			if(preparedStatement != null)
				try {
					preparedStatement.close();
				}catch(SQLException close ) {
					close.printStackTrace();
				}
		}
	}
}
