page 50109 "TOMItemSupplyFactbox"
{
    Caption = 'Supply';
    Editable = false;
    PageType = CardPart;
    SourceTable = Item;

    layout
    {
        area(content)
        {
            field(Inventory; Rec.Inventory)
            {
                ApplicationArea = ALL;

                trigger OnDrillDown()
                var
                    ItemLedgEntry: Record "Item Ledger Entry";
                    ValueEntryT: Record "Value Entry";
                begin
                    ValueEntryT.SetRange("Item No.", Rec."No.");
                    Rec.CopyFilter("Global Dimension 1 Filter", ValueEntryT."Global Dimension 1 Code");
                    Rec.CopyFilter("Global Dimension 2 Filter", ValueEntryT."Global Dimension 2 Code");
                    Rec.CopyFilter("Location Filter", ValueEntryT."Location Code");
                    Rec.CopyFilter("Variant Filter", ValueEntryT."Variant Code");
                    ItemLedgEntry.Reset;
                    ValueEntryT.CopyFilter("Item No.", ItemLedgEntry."Item No.");
                    ItemLedgEntry.SetFilter("Remaining Quantity", '<>%1', 0);
                    PAGE.Run(0, ItemLedgEntry, ItemLedgEntry."Remaining Quantity");
                end;
            }
            field("Purch. Req. Receipt (Qty.)"; Rec."Purch. Req. Receipt (Qty.)")
            {
                ApplicationArea = ALL;
                Caption = 'Qty. on Req. Worksheet';
            }
            field("Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
            {
                ApplicationArea = ALL;
            }
            field("Qty. on Prod. Order"; Rec."Qty. on Prod. Order")
            {
                ApplicationArea = ALL;
            }
            field("Qty. in Transit"; Rec."Qty. in Transit")
            {
                ApplicationArea = ALL;
                Caption = 'Qty. on Transfer Order';
            }
            field("Qty. on Assembly Order"; Rec."Qty. on Assembly Order")
            {
                ApplicationArea = ALL;
                Importance = Additional;
            }
            field(NetSupply; NetSupply)
            {
                ApplicationArea = ALL;
                Caption = 'Net Supply';
                DecimalPlaces = 0: 0;
            }
        }
    }
    actions
    {
    }
    trigger OnAfterGetRecord()
    begin
        if Rec."No." <> '' then begin
            Rec.CalcFields(Inventory, "Qty. on Purch. Order", "Qty. on Prod. Order", "Qty. in Transit", "Purch. Req. Receipt (Qty.)", "Qty. on Assembly Order");
            NetSupply:=Rec.Inventory + Rec."Purch. Req. Receipt (Qty.)" + Rec."Qty. on Purch. Order" + Rec."Qty. on Prod. Order" + Rec."Qty. in Transit" + Rec."Qty. on Assembly Order";
        end;
    end;
    var NetSupply: Decimal;
}
