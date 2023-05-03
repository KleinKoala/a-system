using MainMyService as service from '../../srv/service';

annotate service.System with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'SystemID',
            Value : SystemID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'SystemName',
            Value : SystemName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'SystemDescription',
            Value : SystemDescription,
        },
        {
            $Type : 'UI.DataField',
            Label : 'SystemVersion',
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
                Label : 'SystemID',
                Value : SystemID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SystemName',
                Value : SystemName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SystemDescription',
                Value : SystemDescription,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SystemVersion',
                Value : SystemVersion,
            },
            {
                $Type : 'UI.DataField',
                Value : ImportFile,
                Label : 'ImportFile',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Modules',
            ID : 'Modules',
            Target : 'Modules/@UI.LineItem#Modules',
        },
    ]
);
annotate service.Modul with @(
    UI.LineItem #Modules : [
        {
            $Type : 'UI.DataField',
            Value : ModulDescription,
            Label : 'ModulDescription',
        },{
            $Type : 'UI.DataField',
            Value : ModulID,
            Label : 'ModulID',
        },{
            $Type : 'UI.DataField',
            Value : ModulName,
            Label : 'ModulName',
        },]
);
annotate service.Modul with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Features',
            ID : 'Features',
            Target : 'Features/@UI.LineItem#Features',
        },
    ]
);
annotate service.Feature with @(
    UI.LineItem #Features : [
    ]
);
