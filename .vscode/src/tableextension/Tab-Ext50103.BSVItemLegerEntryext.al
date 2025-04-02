namespace ALProject.ALProject;

using Microsoft.Inventory.Ledger;

tableextension 50103 "BSV Item Leger Entry ext" extends "Item Ledger Entry"
{
    fields
    {
        field(50101; "Cert No."; Code[20])
        {
            Caption = 'Cert No.';
            DataClassification = ToBeClassified;
        }
    }
}
