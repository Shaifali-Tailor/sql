/* MODULE 4 */
/* NULL Management */


/* 1. IFNULL: Missing product_size, missing product_qty_type */ 
SELECT *
,ifnull(product_size,'Unknown') as new_product_size
,ifnull(product_size,product_qty_type) as both_null

/* 2. Coalesce */
,coalesce(product_size,product_qty_type) as still_both_null 
,coalesce(product_size,product_qty_type,'missing') as new_col --if both column null then assign valuse missing in new col
from product;
/* 3. NULLIF
finding values in the product_size column that are "blank" strings and setting them to NULL if they are blank */
SELECT *
,coalesce(product_size,'Unknown') as new_prod_size
,nullif(product_size,'') as nullif_check
,coalesce(nullif(product_size,''),'Unknown') as better_prod_size

/* 4. NULLIF 
filtering which rows are null or blank */

FROM product
