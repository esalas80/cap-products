namespace com.erva;

type Gender: String enum
{
    Male   = 'M';
    Female = 'F';
};

/**"Enumerdaores" */
// entity Order {
//     clienteGender : Gender;
//     status: Integer enum {
//         submitted = 1;
//         fulfilled = 2;
//         Shipped = 3;
//         Cancelled = 4;
//     };
//     Priority: Integer enum {
//         Low = 1;
//         Medium = 2;
//         High = 3;
//     };
// }

type Address {
    Street     : String;
    City       : String;
    State      : String;
    PostalCode : String(5);
    Country    : String(3);
};
entity Products {
    key ID               : UUID;
        Name             : String;
        Description      : String;
        ImageUrl         : String;
        ReleaseDate      : DateTime default $now();
        DiscontinuedDate : DateTime default $now();
        Price            : Decimal(16, 2);
        Height           : type of Price; //Decimal(16, 2);
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
};

entity Suppliers {
    key ID         : UUID;
        Name       : Products:Name;
        Address    : Address;
        Email      : String;
        Phone      : String;
        Fax        : String;
};


entity Category {
    key ID   : String(1);
        Name : String;
};

entity StockAvailability {
    key ProductID   : Integer;
        Description : String;
};

entity Currency {
    key ID          : String(3);
        Description : String;
};

entity UnitOfMeasure {
    key ID          : String(2);
        Description : String;
};

entity DimensionUnits {
    key ID          : String(2);
        Description : String;

};

entity Months {
    key ID               : String(2);
        Description      : String;
        ShortDescription : String(3);
};

entity ProductReview {
    key Name    : String;
        Rating  : Integer;
        Comment : String;
};

entity SalesData {
    key ID : UUID;
        DeliveryDate : DateTime;
        Revenue      : Decimal(16, 2);
};
