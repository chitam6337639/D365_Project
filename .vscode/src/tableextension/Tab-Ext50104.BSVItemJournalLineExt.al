namespace ALProject.ALProject;

using Microsoft.Inventory.Journal;

tableextension 50104 "BSV Item Journal Line Ext" extends "Item Journal Line"
{
    fields
    {
        field(50100; "Cert No."; Code[20])
        {
            Caption = 'Cert No.';
            DataClassification = ToBeClassified;
        }
    }
}
