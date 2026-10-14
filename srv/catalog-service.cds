using {com.erva as erva} from '../db/schema';

service CatalogService {
    entity Products as projection on erva.Products;
    entity Suppliers as projection on erva.Suppliers;
    entity Orders as projection on erva.Orders;
}
