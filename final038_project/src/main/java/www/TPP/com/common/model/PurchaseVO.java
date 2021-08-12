package www.TPP.com.common.model;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PurchaseVO {
   private String purchaseId;
   private int count;
   private String pptForSaleId;
   private String userId;
   private Date purchaseDate;
   
   private String cart; // 장바구니에 있는가
}