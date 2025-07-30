sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/logaligroup/booksxmlannotatios/test/integration/FirstJourney',
		'com/logaligroup/booksxmlannotatios/test/integration/pages/BooksList',
		'com/logaligroup/booksxmlannotatios/test/integration/pages/BooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, BooksList, BooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/logaligroup/booksxmlannotatios') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBooksList: BooksList,
					onTheBooksObjectPage: BooksObjectPage
                }
            },
            opaJourney.run
        );
    }
);