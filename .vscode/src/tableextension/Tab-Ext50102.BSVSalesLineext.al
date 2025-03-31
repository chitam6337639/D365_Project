tableextension 50102 "BSV Sales Line Ext" extends "Sales Line"
{
    fields
    {
        modify("No.")
        {
            trigger OnAfterValidate()
            begin
                ValidateCertification();
            end;
        }

    }
    procedure ValidateCertification()
    var
        ItemRec: Record Item;
        ItemCert: Record "BSV Item Certification";
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
}
