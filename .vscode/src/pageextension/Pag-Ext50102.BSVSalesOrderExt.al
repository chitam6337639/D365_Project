// namespace ALProject.ALProject;

// using Microsoft.Sales.Document;
// using Microsoft.Inventory.Item;

// pageextension 50102 "BSV Sales Order Ext" extends "Sales Order Subform"
// {
//     layout
//     {
//         modify("No.")
//         {
//             trigger OnAfterValidate()
//             var
//                 ItemRec: Record Item;
//                 ItemCert: Record "BSV Item Certification";
//             begin
//                 if Rec."No." <> '' then begin
//                     if ItemRec.Get(Rec."No.") then begin
//                         if ItemRec."Certification Code" = '' then
//                             Error('Item does not have Certification Code', Rec."No.");

//                         if ItemCert.Get(ItemRec."No.", ItemRec."Certification Code") then begin
//                             // if ItemCert."End Date" < Today then
//                             if ItemCert.Active = true then
//                                 Error('The certification has expired', Rec."No.");
//                          end 
//// else
//  //   Error('Certification code not found', ItemRec."Certification Code");
//                     end;
//                 end;
//             end;
//         }
//     }
// }
