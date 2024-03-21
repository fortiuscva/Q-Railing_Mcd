page 50100 "TOMItemDemandFactbox"
{
    Caption = 'Demand';
    Editable = false;
    PageType = CardPart;
    SourceTable = Item;

    layout
    {
        area(content)
        {
            field("Qty. on Component Lines"; Rec."Qty. on Component Lines")
            {
                ApplicationArea = ALL;
            }
            field("Qty. on Sales Order"; rec."Qty. on Sales Order")
            {
                ApplicationArea = ALL;
            }
            field("Qty. on Service Order"; Rec."Qty. on Service Order")
            {
                ApplicationArea = ALL;
            }
            field("Qty. on Job Order"; Rec."Qty. on Job Order")
            {
                ApplicationArea = ALL;
            }
            field("Qty. on Asm. Component"; Rec."Qty. on Asm. Component")
            {
                ApplicationArea = ALL;
                Importance = Additional;
            }
            field("Qty. in Transit"; Rec."Qty. in Transit")
            {
                ApplicationArea = All;
                Caption = 'Qty. on Transfer Order';
            }
            field(NetDemand; NetDemand)
            {
                ApplicationArea = ALL;
                Caption = 'Net Demand';
                DecimalPlaces = 0: 0;
            }
            field(NetAvailable; NetAvailable)
            {
                ApplicationArea = ALL;
                Caption = 'Net Available';
                DecimalPlaces = 0: 0;
            }
        }
    }
    actions
    {
    }
    trigger OnAfterGetRecord()
    begin
        if rec."No." <> '' then begin
            Rec.CalcFields(Inventory, "Qty. on Purch. Order", "Qty. on Prod. Order", "Qty. in Transit", "Purch. Req. Receipt (Qty.)", "Qty. on Sales Order", "Qty. on Service Order", "Qty. on Component Lines", "Qty. on Asm. Component");
            NetSupply:=Rec.Inventory + Rec."Purch. Req. Receipt (Qty.)" + Rec."Qty. on Purch. Order" + Rec."Qty. on Prod. Order" + Rec."Qty. in Transit" + Rec."Qty. on Assembly Order";
            NetDemand:=Rec."Qty. on Sales Order" + Rec."Qty. on Service Order" + Rec."Qty. on Component Lines" + Rec."Qty. on Job Order" + Rec."Qty. on Asm. Component";
            NetAvailable:=NetSupply - NetDemand;
        end;
    end;
    var NetSupply: Decimal;
    NetDemand: Decimal;
    NetAvailable: Decimal;
}
