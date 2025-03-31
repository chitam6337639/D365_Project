namespace ALProject.ALProject;

using Microsoft.Inventory.Ledger;

pageextension 50102 "BSV Item Ledger Entries Ext" extends "Item Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {
            field("Certification Code"; Rec."Certification Code")
            {
                ApplicationArea = All;
            }
        }
    }
}
