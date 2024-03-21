tableextension 50105 McdSalesReceivablesSetup extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; McdRestockAccountNo; Code[20])
        {
            TableRelation = "G/L Account";
            Caption = 'Restock Account No.';
            DataClassification = CustomerContent;
        }
        field(50101; McdRestockFeePercentage; decimal)
        {
            Caption = 'Restock Fee Percentage';
            DataClassification = CustomerContent;
        }
    }
}
