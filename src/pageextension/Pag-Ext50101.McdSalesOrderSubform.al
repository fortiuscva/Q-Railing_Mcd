pageextension 50101 McdSalesOrderSubform extends "Sales Order Subform"
{
    layout
    {
        addafter("Gross Weight")
        {
            field(McdTotalWeight; Rec.McdTotalWeight)
            {
                Editable = false;
                ApplicationArea = All;
            }
            field(McdInnerSalespersonCode; Rec.McdInnerSalespersonCode)
            {
                ApplicationArea = All;
            }
            field(McdOuterSalespersonCode; Rec.McdOuterSalespersonCode)
            {
                ApplicationArea = All;
            }
        }
        addafter("Total Amount Incl. VAT")
        {
            field(TotalGrossWeight; SalesHeader.McdTotalGrossWeight)
            {
                Editable = false;
                Caption = 'Total Weight';
                ApplicationArea = All;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        if SalesHeader.get(rec."Document Type", rec."Document No.")then SalesHeader.CalcFields(McdTotalGrossWeight);
    end;
    var SalesHeader: Record "Sales Header";
}
