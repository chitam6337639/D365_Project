tableextension 50102 "BSV Sales Line Ext" extends "Sales Line"
{
    fields
    {
        modify("No.")
        {
            trigger OnAfterValidate()
            begin
                ValidateCertification();
                AutoSetCertification();
            end;
        }
        field(50101; "Cert No."; Code[20])
        {
            Caption = 'Cert No.';
            DataClassification = ToBeClassified;
        }
    }
    procedure ValidateCertification()
    var
        ItemRec: Record Item;
        ItemCert: Record "BSV Item Certification";
        lText: Text;
    begin
        if Rec."No." <> '' then begin
            if ItemRec.Get(Rec."No.") then begin
                if ItemRec."Certification Code" = '' then
                    Error('item does not have cert Code', Rec."No.");

                if ItemCert.Get(ItemRec."No.", ItemRec."Certification Code") then begin
                    if ItemCert."End Date" < Today then
                        Error('the cert has expired', Rec."No.");
                end
            end;
        end;
    end;

    procedure AutoSetCertification()
    var
        ItemRec: Record Item;
    begin
        if ItemRec.Get(Rec."No.") then
            Rec."Cert No." := ItemRec."Certification Code";

    end;
}
