pageextension 50103 McdSalesOrder extends "Sales Order"
{
    layout
    {
        addafter("External Document No.")
        {
            field(McdTotalGrossWeight; Rec.McdTotalGrossWeight)
            {
                ApplicationArea = All;
            }
        }
        addafter("Shipping Agent Service Code")
        {
            field(McdShippingNote; Rec.McdShippingNote)
            {
                ApplicationArea = All;
            }
        }
        addafter("Salesperson Code")
        {
            field(McdInnerSalespersonCode; Rec.McdOuterSalespersonCode)
            {
                ApplicationArea = All;
            }
        }
        modify("Salesperson Code")
        {
            Caption = 'Inner Salesperson Code';
        }
        addfirst(factboxes)
        {
            part(ItemSupplyFactbox; TOMItemSupplyFactbox)
            {
                ApplicationArea = All;
                Provider = SalesLines;
                SubPageLink = "No."=field("No.");
            }
        }
        addafter(ItemSupplyFactbox)
        {
            part(ItemDemandFactbox; TOMItemDemandFactbox)
            {
                ApplicationArea = All;
                Provider = SalesLines;
                SubPageLink = "No."=field("No.");
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        CurrPage.Update(false);
    end;
}
