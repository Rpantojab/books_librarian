using BooksSRV as service from '../../srv/books';

annotate service.Books with @(
    Capabilities.FilterRestrictions: {
        $Type                       : 'Capabilities.FilterRestrictionsType',
        FilterExpressionRestrictions: [{
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : 'bookCode',
            AllowedExpressions: 'SearchExpression',
        }]
    },


    UI.SelectionFields             : [
        bookCode,
        author,
        category_ID,
        language_code,
        stock_code,
        rating,
    ],

    UI.DataPoint #Rating           : {
        Value        : rating,
        TargetValue  : 5,
        Visualization: #Rating
    },

    UI.LineItem                    : [
        {
            $Type: 'UI.DataField',
            Label: 'BookCode',
            Value: bookCode,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Title',
            Value: title,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: description,
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Label: 'Author',
            Value: author,
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Label: 'Category ID',
            Value: category.category,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Language Code',
            Value: language_code,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Label : 'Rating',
            Target: '@UI.DataPoint#Rating'
        },
        {
            $Type: 'UI.DataField',
            Label: 'Stock',
            Value: stock.descr,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Price',
            Value: price,
        },
    ],

    UI.FieldGroup #Group           : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'bookCode',
                Value: bookCode,
            },
            {
                $Type: 'UI.DataField',
                Label: 'title',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Label: 'description',
                Value: description,
            },
            {
                $Type: 'UI.DataField',
                Label: 'author',
                Value: author,
            },
            {
                $Type: 'UI.DataField',
                Label: 'language_code',
                Value: language_code,
            },
            {
                $Type: 'UI.DataField',
                Label: 'publicationYear',
                Value: publicationYear,
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Label : 'Rating',
                Target: '@UI.DataPoint#Rating'
            },
            {
                $Type: 'UI.DataField',
                Label: 'rating',
                Value: rating,
            },
            {
                $Type: 'UI.DataField',
                Label: 'price',
                Value: price,
            },
            {
                $Type: 'UI.DataField',
                Label: 'currency_code',
                Value: currency_code,
            },
            {
                $Type: 'UI.DataField',
                Label: 'stock_code',
                Value: stock_code,
            },
        ],
    },
    UI.Facets                      : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'FacetBooks',
        Label : 'Book Informations',
        Target: '@UI.FieldGroup#Group',
    }, ],

);

// annotate service.Books with {
//     @Capabilities.FilterRestrictions: {FilterExpressionRestrictions: [{
//         Property          : 'bookCode',
//         AllowedExpressions: [
//             'EQ',
//             'Contains'
//         ]
//     }]};

annotate service.Books with {
    @Common.FilterDefaultValue: '100000047'
    bookCode
};

annotate service.Books with {
    category @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'VH_Categories',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: category_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'category',
            },
        ],
    };

    stock    @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'VH_Status',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: stock_code,
                ValueListProperty: 'code',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'descr',
            },
        ],
    };
};
