tableextension 50103 McdItem extends Item
{
    fields
    {
        field(50100; "McdMasterItemNo."; Text[50])
        {
            Caption = 'Master Item No.';
            DataClassification = CustomerContent;
        }
        field(50101; McdSize; Text[10])
        {
            Caption = 'Size';
            DataClassification = CustomerContent;
        }
        field(50102; McdColor; Text[10])
        {
            Caption = 'Color';
            DataClassification = CustomerContent;
        }
        field(50103; McdStyle; Text[10])
        {
            Caption = 'Style';
            DataClassification = CustomerContent;
        }
    }
}
