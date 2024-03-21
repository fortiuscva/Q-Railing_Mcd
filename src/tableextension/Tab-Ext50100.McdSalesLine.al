tableextension 50100 McdSalesLine extends "Sales Line"
{
    fields
    {
        field(50100; McdTotalWeight; Decimal)
        {
            Caption = 'Total Weight';
            DataClassification = CustomerContent;
        }
        field(50101; McdInnerSalespersonCode; Code[20])
        {
            Editable = false;
            Caption = 'Inner Salesperson Code';
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header"."Salesperson Code" where("Document Type"=field("Document Type"), "No."=field("Document No.")));
        //TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
        }
        field(50102; McdOuterSalespersonCode; Code[20])
        {
            Caption = 'Outer Salesperson Code';
            //TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Header".McdOuterSalespersonCode where("Document Type"=field("Document Type"), "No."=field("Document No.")));
        }
    }
}
