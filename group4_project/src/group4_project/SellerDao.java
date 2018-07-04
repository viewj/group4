package group4_project;
import group4_project.Seller;
import connDB.DriverDB;
import java.sql.*;
import java.util.ArrayList;

public class SellerDao {
	
	public  ArrayList<Seller> updatesellerSelect() {
		ArrayList<Seller> choiceLIst = new ArrayList<Seller>();
		Seller seller = new Seller();
		DriverDB driverDb = new DriverDB();
		
		PreparedStatement preparedStatement = null;
		Connection connection = null;
		
		connection = driverDb.driverDbcon();
		//driverDb �����ȿ� �ִ� �ּҰ��� ã�ư� driverDbcon()�޼��带 ������ �� my-sql������ ��������ϴ�. 
		
		String SelectQuery = "SELECT sell_name ,sell_address ,sell_price ,sell_content ,sell_category ,sell_menu FROM seller sell_code=?";
		
		return null;
	}
	
	//��ǰ ����� �ϱ� ���� �޼����Դϴ�.
	public void insertSeller(Seller seller) {
		
		PreparedStatement preparedStatement = null;
		Connection connection = null;
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDbcon();
		
		try {
			String insertQuery = "INSERT INTO seller(member_id ,sell_name ,sell_address ,sell_category ,sell_menu ,sell_price ,sell_date ,sell_content) VALUES(? ,? ,? ,? ,? ,? ,now() ,?)";
			preparedStatement = connection.prepareStatement(insertQuery);
			preparedStatement.setString(1, null);
			preparedStatement.setString(2, seller.getSell_name());
			preparedStatement.setString(3, seller.getSell_address());
			preparedStatement.setString(4, seller.getSell_category());
			preparedStatement.setString(5, seller.getSell_menu());
			preparedStatement.setString(6, seller.getSell_price());
			preparedStatement.setString(7, seller.getSell_content());
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
