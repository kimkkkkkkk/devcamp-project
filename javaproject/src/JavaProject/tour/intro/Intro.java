package JavaProject.tour.intro;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.AbstractTableModel;




public class Intro extends JFrame{
   
   JPanel p_center;
   JPanel p_north;
   
   JPanel empty;
   JLabel reviewTitle;
   JButton hotelButton;
   JButton rentButton;
   JButton chatConsult; 
   
   JTable table; // 테이블 
   JScrollPane t_scroll;

   String[] columnName = { "리뷰", "리뷰", "리뷰",  "리뷰"};
   String[][] rows = {};

   //Color color =new Color();
  
  

   
   public  Intro() {

	  setTitle("Review");
     //상단바 & 테이블
      p_center= new JPanel();
      p_north = new JPanel();  
      empty = new JPanel();
      reviewTitle = new JLabel("[ 상품 리뷰 목록 ]");  
      reviewTitle.setFont(new Font("ITALIC", Font.BOLD, 24));
      reviewTitle.setForeground(Color.DARK_GRAY);
      //reviewTitle.setHorizontalAlignment(JLabel.HEIGHT);
      table = new JTable(new AbstractTableModel() {

 
      public int getRowCount() {
         return rows.length;
      }

      public int getColumnCount() {
         return columnName.length;
      }

      public String getColumnName(int col) { 
         return columnName[col];
      }

      public Object getValueAt(int row, int col) {
         return rows[row][col];
      }
   });
     

      
      t_scroll=new JScrollPane(table);
      hotelButton = new JButton("hotel");
      hotelButton.setForeground(Color.WHITE);
      hotelButton.setBackground(Color.darkGray);
      rentButton = new JButton("rentcar");
      rentButton.setForeground(Color.WHITE);
      rentButton.setBackground(Color.darkGray);
      chatConsult = new JButton("채팅 상담");
      chatConsult.setForeground(Color.WHITE);
      chatConsult.setBackground(Color.darkGray);
      
      
      //스타일 및 레이아웃 

      empty.setPreferredSize(new Dimension(750,50));
      empty.setBackground(Color.WHITE);
      p_center.setBackground(Color.WHITE);
      p_north.setBackground(Color.WHITE);
      reviewTitle.setFont(new Font("Dialog", Font.PLAIN, 25));
      t_scroll.setPreferredSize(new Dimension(1000,380));
      p_center.setPreferredSize(new Dimension(100, 20));

      empty.add(reviewTitle);
      p_north.add(empty);
      p_north.add(hotelButton);  
      p_north.add(rentButton);  
      p_north.add(chatConsult);  
      p_center.add(t_scroll);
  
     
     
      add(p_north, BorderLayout.NORTH);
      add(p_center, BorderLayout.CENTER);
      add(p_center);
  
   
      //보여주기
      setBounds(300,100,1300,500);
      setVisible(true);

	}

}
