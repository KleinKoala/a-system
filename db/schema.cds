namespace aschema;

entity System {
    key SystemID          : Integer;
        SystemName        : String;
        SystemDescription : String;
        SystemVersion     : Integer;
        ImportFile        : LargeBinary  @Core.MediaType: 'application/json'  @Core.ContentDisposition.Filename: 'inline'  @Core.ContentDisposition.Type: 'inline';
        Modules           : Composition of many Modul
                                on Modules.System = $self;

}

entity Modul {
    key ModulID          : UUID;
        ModulName        : String;
        ModulDescription : String;
        System           : Association to one System;
        Features         : Composition of many Feature
                               on Features.Modul = $self;
}

entity Feature {
    key FeatureID          : UUID;
        FeatureName        : String;
        FeatureDescription : String;
        Modul              : Association to one Modul;
}
