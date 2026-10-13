using {com.erva as erva} from '../db/schema';

service CatalogService {
    entity Products as projection on erva.Products {
        ID,
        Name,
        Description,
        ImageUrl,
        ReleaseDate,
        DiscontinuedDate,
        Price,
        Height,
        Width,
        Depth,
        Quantity
    };
}
