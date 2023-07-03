using MainMyService as service from '../../srv/service';

annotate service.System with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Systemid}',
            Value : SystemID,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Systemname}',
            Value : SystemName,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Systemdescription}',
            Value : SystemDescription,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Systemversion}',
            Value : SystemVersion,
        },
    ]
);
annotate service.System with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Systemid}',
                Value : SystemID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Systemname}',
                Value : SystemName,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Systemdescription}',
                Value : SystemDescription,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Systemversion}',
                Value : SystemVersion,
            },
            {
                $Type : 'UI.DataField',
                Value : ImportFile,
                Label : '{i18n>Importfile}',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>GeneralInformation}',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Modules}',
            ID : 'Modules',
            Target : 'Modules/@UI.LineItem#Modules',
        },
    ]
);
annotate service.Modul with @(
    UI.LineItem #Modules : [
        {
            $Type : 'UI.DataField',
            Value : ModulID,
            Label : '{i18n>Modulid}',
        },
        {
            $Type : 'UI.DataField',
            Value : ModulName,
            Label : '{i18n>Modulname}',
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : ModulDescription,
            Label : '{i18n>Moduldescription}',
        },]
);
annotate service.Modul with @(
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>GeneralInformation}',
                ID : 'i18nGeneralInformation',
                Facets : [],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Features}',
            ID : 'Features',
            Target : 'Features/@UI.LineItem#Features',
        },
    ]
);
annotate service.Feature with @(
    UI.LineItem #Features : [
        {
            $Type : 'UI.DataField',
            Value : FeatureID,
            Label : 'FeatureID',
        },
        {
            $Type : 'UI.DataField',
            Value : FeatureName,
            Label : 'FeatureName',
        },
        {
            $Type : 'UI.DataField',
            Value : FeatureDescription,
            Label : 'FeatureDescription',
        },]
);
annotate service.System with @(
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Label : '{i18n>ProcessImportFile}',
            Action : 'MainMyService.processImportFile',
        },
    ]
);
annotate service.Modul with @(
    UI.FieldGroup #generlInformations : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ModulName,
                Label : 'ModulName',
            },{
                $Type : 'UI.DataField',
                Value : ModulDescription,
                Label : 'ModulDescription',
            },],
    }
);
