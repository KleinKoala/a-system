//import cds from '@sap/cds';
const cds = require('@sap/cds');


module.exports = async srv => {
    const db = await cds.connect.to ('db');
    
    srv.on('processImportFile','System',  async (data) => {
        const { System } = db.entities();
        let system = await db.read(System).where({SystemID: 1});
        
        console.log (system);
        let sysobj = JSON.parse(system[0].ImportFile.toString());
        console.log(sysobj);

        sysobj.details.components.forEach(modul => {
            
            modul.features.forEach(feature => {
                
            });
        });

    })
}
