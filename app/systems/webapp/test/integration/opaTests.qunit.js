sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ilc/systems/test/integration/FirstJourney',
		'ilc/systems/test/integration/pages/SystemList',
		'ilc/systems/test/integration/pages/SystemObjectPage'
    ],
    function(JourneyRunner, opaJourney, SystemList, SystemObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ilc/systems') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSystemList: SystemList,
					onTheSystemObjectPage: SystemObjectPage
                }
            },
            opaJourney.run
        );
    }
);