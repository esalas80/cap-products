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

//Asociaciones no administradas
entity Products {
    key ID               : UUID;
        Name             : String not null;
        Description      : String;
        ImageUrl         : String;
        ReleaseDate      : DateTime default $now();
        DiscontinuedDate : DateTime default $now();
        Price            : Decimal(16, 2);
        Height           : type of Price; //Decimal(16, 2);
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);

        //Asociaciones no administradas
        // Supplier_Id        :UUID;
        // ToSupplier: Association to one Suppliers on ToSupplier.ID = Supplier_Id;
        // UnitOFMeasure_Id      : String(2);
        // ToUnitOfMeasure: Association to  UnitOfMeasure on ToUnitOfMeasure.ID = UnitOFMeasure_Id;

        //Asociaciones  administradas

        Supplier: Association to one Suppliers;
        UnitOfMeasure: Association to one UnitOfMeasure;
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

extend Products with {
    PriceCondition : String(2);
    PriceDetermination : String(3);
};  