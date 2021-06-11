package JavaProject.tour.hotel;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.SAXException;

import JavaProject.tour.DBManager;
import JavaProject.tour.TourApp;


public class HotelMain extends JFrame{
   JPanel p_north,p_east;
   JLabel la_search;//지역 검색 라벨
   JTextField t_hotelName;
   JButton bt_search;
   JButton loadXml;
   
   JTable table;
   JScrollPane scroll;
   
   JLabel la_hotel;//이름
   JTextField t_hotel;
   JLabel la_area;//지역
   JTextField t_area;
   JLabel la_type;//종류
   JTextField t_type;
   JLabel la_price;//가격
   JTextField t_price;
   JLabel la_checkin;//예약 시작일
   JTextField t_checkin;
   JLabel la_checkout;//예약 종료일
   JTextField t_checkout;
   JButton bt_reservation;//예약하기
   JButton bt_diary;
   
   
   DBManager dbmanager=new DBManager();
   HotelHandler handler;
   Diary diary;
   TourApp tourApp;
   HotelModel model;
   Connection con;

   public HotelMain(TourApp tourApp) {
     this.tourApp=tourApp;
    
      //생성
      p_north=new JPanel();
      p_north.setBackground(Color.WHITE);
      
      la_search=new JLabel("지역을 검색 해주세요                         ex)서울,충청도,제주도...");
      la_search.setForeground(Color.DARK_GRAY);
      
      t_hotelName=new JTextField(25);
      loadXml=new JButton("목록보기");
      loadXml.setBackground(Color.DARK_GRAY);
      loadXml.setForeground(Color.WHITE);
      
      bt_search=new JButton("검색");
      bt_search.setBackground(Color.DARK_GRAY);
      bt_search.setForeground(Color.WHITE);
      
      //센터
      table=new JTable();
      scroll=new JScrollPane(table);
      
      p_east=new JPanel();
      p_north.setBackground(Color.WHITE);
      
      la_hotel=new JLabel("숙소이름");
      la_hotel.setForeground(Color.DARK_GRAY);
      t_hotel=new JTextField();
      la_area=new JLabel("지역");
      la_area.setForeground(Color.DARK_GRAY);
      t_area=new JTextField();
      la_type=new JLabel("숙박종류");
      la_type.setForeground(Color.DARK_GRAY);
      t_type=new JTextField();
      la_price=new JLabel("가격");
      la_price.setForeground(Color.DARK_GRAY);
      t_price=new JTextField();
      la_checkin=new JLabel("예약시작일");
      la_checkin.setForeground(Color.DARK_GRAY);
      
      t_checkin=new JTextField();
      la_checkout=new JLabel("예약종료일");
      la_checkout.setForeground(Color.DARK_GRAY);
      t_checkout=new JTextField();
      bt_reservation=new JButton("예약하기");
      bt_reservation.setBackground(Color.DARK_GRAY);
      bt_reservation.setForeground(Color.WHITE);
      
      bt_diary=new JButton("예약일");
      bt_diary.setBackground(Color.DARK_GRAY);
      bt_diary.setForeground(Color.WHITE);
      
      //스타일 


      scroll.setPreferredSize(new Dimension(800,400));
      p_east.setLayout(new FlowLayout());
      p_east.setPreferredSize(new Dimension(500,400));
      
      Dimension d=new Dimension(400,30);
      t_hotel.setPreferredSize(d);
      t_area.setPreferredSize(d);
      t_type.setPreferredSize(d);
      t_price.setPreferredSize(d);
      t_checkin.setPreferredSize(d);
      t_checkout.setPreferredSize(d);
      
      Dimension a=new Dimension(80,30);
      la_hotel.setPreferredSize(a);
      la_area.setPreferredSize(a);
      la_type.setPreferredSize(a);
      la_price.setPreferredSize(a);
      la_checkin.setPreferredSize(a);
      la_checkout.setPreferredSize(a);
      la_search.setPreferredSize(new Dimension(330,30));
      
      
      //조립
      
      p_north.add(la_search);
     p_north.add(t_hotelName);
     p_north.add(loadXml);
     p_north.add(bt_search);
     add(p_north,BorderLayout.NORTH);
 
   
      add(scroll);
      p_east.add(la_hotel);
      p_east.add(t_hotel);
      p_east.add(la_area);
      p_east.add(t_area);
      p_east.add(la_type);
      p_east.add(t_type);
      p_east.add(la_price);
      p_east.add(t_price);
      p_east.add(la_checkin);
      p_east.add(t_checkin);
      p_east.add(la_checkout);
      p_east.add(t_checkout);
      p_east.add(bt_diary);
      p_east.add(bt_reservation);
      add(p_east,BorderLayout.EAST);
      
      //리스너
      
     //검색
     loadXml.addActionListener(new ActionListener() {   
      public void actionPerformed(ActionEvent e) {
         loadXML();   
      }
     });
     bt_search.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent e) {
           search();
        }
     });
     
     //예약하기
     bt_reservation.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent e) {
           reserv();
        }
     });
     bt_diary.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e) {
         t_checkin.setText("");
         t_checkout.setText("");
         diary=new Diary(HotelMain.this);
      }
     });
      
      
     //상세보기
     table.addMouseListener(new MouseAdapter() {
        public void mouseReleased(MouseEvent e) {
           String hotelName=(String) table.getValueAt(table.getSelectedRow(), 0);
           String area=(String) table.getValueAt(table.getSelectedRow(), 1);
           String hotelType=(String) table.getValueAt(table.getSelectedRow(), 2);
           int price=Integer.parseInt((String)table.getValueAt(table.getSelectedRow(), 3));
           
           t_hotel.setText(hotelName);
           t_area.setText(area);
           t_type.setText(hotelType);
           t_price.setText(Integer.toString(price));
        }
     });      
   
      setBounds(300,100,1300,500);
      setVisible(true);
      setDefaultCloseOperation(DISPOSE_ON_CLOSE);
      
   }
   
   public void loadXML() {
      SAXParserFactory factory=SAXParserFactory.newInstance();//팩토리의 인스턴스 얻기
      
      try {
         URL url=this.getClass().getClassLoader().getResource("hotel.xml");
         URI uri=url.toURI();
         SAXParser saxParser=factory.newSAXParser();//파서생성
         saxParser.parse(new File(uri),handler=new HotelHandler());
         //JTable의 모델 데이터와 파싱한 결과와의 매칭은 파싱 전? 파싱한 후?
         model=new HotelModel();
         model.data=handler.hotelList;
         
         table.setModel(model);//바로 이 순간부터 JTable은  TableModel의
                                         //메서드들을 호출하게된다~~? 왜? 그래야 표를 구성하니깐..
         
      } catch (URISyntaxException e) {
         e.printStackTrace();
      } catch (ParserConfigurationException e) {
         e.printStackTrace();
      } catch (SAXException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      
   }
   
   
      
   public void reserv() {
      String sql="insert into h_reserv(m_name,h_name,h_area,h_type,checkin,checkout,h_price) values(?,?,?,?,?,?,?)";
      PreparedStatement pstmt=null;
      con=dbmanager.getConnection();
      
      try {
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1,tourApp.getMember().getM_name());
         pstmt.setString(2, t_hotel.getText());
         pstmt.setString(3, t_area.getText());
         pstmt.setString(4, t_type.getText());
         pstmt.setString(5, t_checkin.getText());
         pstmt.setString(6, t_checkout.getText());
         pstmt.setString(7, t_price.getText());
         
         int result=pstmt.executeUpdate();
         if(result==1) {
            JOptionPane.showMessageDialog(this, "등록성공");
         }else {
            JOptionPane.showMessageDialog(this, "등록실패");
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         dbmanager.release(con,pstmt);
      }
   }
   
   
      public void search() {
        Vector <Hotel>result=new Vector<Hotel>(); //검사결과 담을 벡터 
        String word=t_hotelName.getText();
        
        for(int i=0;i<model.data.size();i++) {
           Hotel hotel=model.data.get(i);
           
           if(hotel.getArea().startsWith(word)) {
              result.add(hotel);
           }
           
        }
        model.data=result;
        //교체 
        table.setModel(model);     
        //업데이트
        table.updateUI();;
      }
      
    
   }