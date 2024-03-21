tableextension 50101 McdSalesHeader extends "Sales Header"
{
    fields
    {
        field(50100; McdTotalGrossWeight; Decimal)
        {
            Editable = false;
            Caption = 'Total Gross Weight';
            FieldClass = FlowField;
            CalcFormula = sum("Sales Line".McdTotalWeight where("Document Type"=field("Document Type"), "Document No."=field("No.")));
        }
        field(50101; McdShippingNote; text[50])
        {
            Caption = 'Shipping Note';
            DataClassification = CustomerContent;
        }
        field(50102; McdOuterSalespersonCode; Code[20])
        {
            Caption = 'Outer Salesperson Code';
            TableRelation = "Salesperson/Purchaser" where(Blocked=const(false));

            trigger OnValidate()
            var
                SalesLine1: Record "Sales Line";
            begin
                if(rec."Document Type" <> rec."Document Type"::Order) and (rec."Document Type" <> rec."Document Type"::"Credit Memo")then exit;
                SalesLine1.Reset();
                SalesLine1.SetRange("Document Type", rec."Document Type");
                SalesLine1.SetRange("Document No.", rec."No.");
                if SalesLine1.FindSet()then repeat SalesLine1.McdInnerSalespersonCode:=rec."Salesperson Code";
                        SalesLine1.McdOuterSalespersonCode:=rec.McdOuterSalespersonCode;
                        SalesLine1.Modify();
                    until SalesLine1.Next() = 0;
            end;
        }
    }
}
