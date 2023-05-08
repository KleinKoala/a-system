using {aschema} from '../db/schema';

service MainMyService {
    entity System  as projection on aschema.System actions {
        action processImportFile()
    };

    annotate System with @odata.draft.enabled; //Bearbeitung der Einzelansicht ermöglicht
    annotate System with @(UI.Identification: [{
    $Type : 'UI.DataFieldForAction',
    Label : 'Process Import File',
    Action: 'MainMyService.processImportFile'
}]);
    entity Modul   as projection on aschema.Modul;
    entity Feature as projection on aschema.Feature;
}


