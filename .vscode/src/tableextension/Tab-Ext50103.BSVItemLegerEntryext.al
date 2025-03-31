namespace ALProject.ALProject;

using Microsoft.Inventory.Ledger;

tableextension 50103 "BSV Item Leger Entry ext" extends "Item Ledger Entry"
{
    fields
    {
        field(50100; "Certification Code"; Code[20])
        {
            Caption = 'Certification Code';
            DataClassification = ToBeClassified;
        }
    }
}
