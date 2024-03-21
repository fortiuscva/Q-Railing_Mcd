pageextension 50108 McdSalesReceivablesSetup extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Ignore Updated Addresses")
        {
            field(McdRestockAccountNo; Rec.McdRestockAccountNo)
            {
                ApplicationArea = All;
            }
            field(McdRestockFeePercentage; Rec.McdRestockFeePercentage)
            {
                ApplicationArea = All;
            }
        }
    }
}
