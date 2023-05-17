const cds = require('@sap/cds');

module.exports = async srv => {
    const db = await cds.connect.to ('db');
    const { System, Modul, Feature } = db.entities();

    srv.on('processImportFile','System',  async () => {
        let system = await db.read(System).where({SystemID: 1});
        let sysobj = JSON.parse(system[0].ImportFile.toString());
        
        try {
            //let insertAll = await db.run (
                sysobj.details.components.forEach(modul => {
                    let insertModul = INSERT.into(Modul).entries({
                        ModulName: modul.id,
                        ModulDescription: modul.description
                    })
                    //let ntries = insertModul.entries()
                    let resMod = db.run(insertModul);
                    
                     //let extraRes = insertModul.affectedRows();
                    
                    console.log('inserted modul: ' +  modul.id);
                    //console.log();

                    modul.features.forEach(feature => {
                        
                        let insertFeature = INSERT.into (Feature).entries({
                            FeatureName: feature.name,
                            FeatureDescription: feature.title
                        })
                        let resFeat = db.run(insertFeature).catch(err => {console.log(err)})

                        /*
                       db.insert(Feature).entries({
                            FeatureName: feature.name,
                            FeatureDescription: feature.title
                        })
                        */  

                        console.log('inserted feature: ' + feature.name)               
                    });
                })
            //); 
            
        }
        catch (err) {
            console.log(err);
        }
        
        
        
    })
    
}
