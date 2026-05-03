package com.Sugar_and_Silk.service;
import com.Sugar_and_Silk.dao.ProductDAO;
import com.Sugar_and_Silk.model.ProductModel;
import java.util.List;
public class ProductService {
	public List<ProductModel> fetchAll() throws Exception {
        ProductDAO productDAO = new ProductDAO();
        return productDAO.getAllProducts();
    }
}
