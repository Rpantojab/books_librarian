namespace com.logaligroup;

using {
    cuid,
    managed,
    sap.common.CodeList,
    sap.common.Currencies,
    sap.common.Languages
} from '@sap/cds/common';


entity Books : cuid, managed {
    bookCode        : String(10);
    title           : String(150);
    description     : String(250);
    author          : String(250);
    category        : Association to Categories;
    language        : Association to Languages;
    publicationYear : Integer;
    rating          : Decimal(3, 2);
    price           : Decimal(6, 2)             @Measures.ISOCurrency: currency_code;
    currency        : Association to Currencies @Common.IsCurrency;
    stock           : Association to Status;
};

entity Categories : cuid {
    category : String(150);
};

entity Years: cuid {
    year: String(4);
};

entity Status : CodeList {
    key code        : String enum {
            Available       = 'In Stock';
            LowAvailability = 'Low Availability';
            NotAvailable    = 'In Not Stock';
        };
        criticality : Int16;
};
