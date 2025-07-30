sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/logaligroup/booksfpmannotatios/test/integration/FirstJourney',
		'com/logaligroup/booksfpmannotatios/test/integration/pages/BooksMain'
    ],
    function(JourneyRunner, opaJourney, BooksMain) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/logaligroup/booksfpmannotatios') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBooksMain: BooksMain
                }
            },
            opaJourney.run
        );
    }
);