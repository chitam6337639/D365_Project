namespace ALProject.ALProject;

using Microsoft.Sales.Document;

pageextension 50103 "BSV Sales Order Line Ext" extends "Sales Order Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Cert No."; Rec."Cert No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
