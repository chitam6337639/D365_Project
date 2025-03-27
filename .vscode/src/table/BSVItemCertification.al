table 50100 "BSV Item Certification"
{
    // Specify table properties, for example 
    Caption = 'BSV Item Certification';
    DataPerCompany = true;

    // Define the table schema
    fields
    {
        field(1; "Item Code"; Code[20])
        {
            Caption = 'Item Code';
            TableRelation = Item."No.";
        }
        field(2; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(3; "Description"; Text[100])
        {
            Caption = 'Description';
        }
        field(4; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(5; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(6; "Active"; Boolean)
        {
            Caption = 'Active';
            Editable = false;
        }
    }

    // Define keys section (optional)
    keys
    {
        key(PK; "Item Code", "Code")
        {
            Clustered = true;
        }
    }

    // Add AL code here (optional)
}