namespace ALProject.ALProject;

using Microsoft.Inventory.Item;

tableextension 50101 "BSV Item ext" extends Item
{
    fields
    {
        field(50100; "Certification Code"; Code[20])
        {
            Caption = 'Certification Code';
            DataClassification = ToBeClassified;
            TableRelation = "BSV Item Certification".Code where(Active = const(true));
        }
    }
}
