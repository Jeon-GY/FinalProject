package www.TPP.com.common.model;

import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import www.TPP.com.board.model.PptForSaleVO;
import www.TPP.com.common.attachFile.model.AttachFileVO;

@Data
@NoArgsConstructor
public class PurchaseVO {
   private String purchaseId;
   private int count;
   private String pptForSaleId;
   private String userId;
   private Date purchaseDate;
   
   private String cart; // 장바구니에 있는가
   
   private PptForSaleVO pptForSaleVO;
   private List<AttachFileVO> listAttach;
   
   private int total;
   
}