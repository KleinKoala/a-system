//import cds from '@sap/cds';

const cds = require('@sap/cds');


module.exports = async srv => {
    const db = await cds.connect.to ('db');
    
    srv.on('processImportFile','System',  async (data) => {
        const { System, Modul, Feature } = db.entities();
        console.log(System)
        let system = await db.read(System).where({SystemID: 1});
        let sysobj = JSON.parse(system[0].ImportFile.toString());        

        sysobj.details.components.forEach(modul => {
            console.log(modul.id);
            
            INSERT.into(Modul).entries({
                //ModulID : UUID() ,
                ModulName: modul.id,
                ModulDescription: modul.description
            })
            /*
            INSERT.into (Modul, modul ,{
                ModulName: modul.id,
                ModulDescription: modul.description
            })            
            */
           //console.log(Modul);
            modul.features.forEach(feature => {
                
                
                
                INSERT.into (Feature).entries({
                    //FeatureID : UUID(),
                    FeatureName: feature.name,
                    FeatureDescription: feature.title
                })
                /*
                console.log(feature.name)
                console.log(feature)
                */
            });
        });
        //let testing = await db.read(Modul).where(ModulName = 'ilc.aut.cal.managecalculation').then(console.log(testing), e => e.message)
        //console.log (system)
        //console.log(sysobj);
        
        
    })
}
