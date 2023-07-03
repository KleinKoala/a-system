const cds = require("@sap/cds");

module.exports = async (srv) => {
  const db = await cds.connect.to("db");
  const { System, Modul, Feature } = db.entities();

  srv.on("processImportFile", "System", async ({ params }) => {
    let systemKey = params[0];
    let systemID = systemKey.SystemID;
    let system = await db.read(System).where({ SystemID: systemID });

    if (!system[0].ImportFile) {
      return;
    }

    let sysobj = JSON.parse(system[0].ImportFile.toString());
    const resultOfModules = sysobj.details.components.map((modul) => {
      let retModulName = modul.id;
      let retModulDescription = modul.description;
      let retModulID = cds.utils.uuid();

      const resultOfFeatures = modul.features.map((f) => {
        let values = { FeatureName: f.name, FeatureDescription: f.title };
        return values;
      });

      let retModul = {
        ModulID: retModulID,
        ModulName: retModulName,
        ModulDescription: retModulDescription,
        Features: resultOfFeatures,
      };
      return retModul;
    });

    let q = await db.run(
      UPDATE(System, systemID).with({ Modules: resultOfModules })
    );

    return q;
  });
};
