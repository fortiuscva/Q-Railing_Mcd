pageextension 50125 "Sales Quote Subform" extends "Sales Quote Subform"
{
    layout
    {
        addafter("Total Amount Incl. VAT")
        {
            field("QRL TotalGrossWeight"; SalesHeader.McdTotalGrossWeight)
            {
                Editable = false;
                Caption = 'Total Weight';
                ApplicationArea = All;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        if SalesHeader.get(rec."Document Type", rec."Document No.") then SalesHeader.CalcFields(McdTotalGrossWeight);
    end;

    var
        SalesHeader: Record "Sales Header";
}
