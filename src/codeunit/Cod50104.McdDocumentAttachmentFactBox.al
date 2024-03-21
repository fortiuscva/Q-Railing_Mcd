codeunit 50104 McdDocumentAttachmentFactBox
{
    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", OnBeforeDrillDown, '', false, false)]
    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        BankDepositHeader: Record "Bank Deposit Header";
        PostedBankDepositHeader: Record "Posted Bank Deposit Header";
    begin
        case DocumentAttachment."Table ID" of database::"Bank Deposit Header": begin
            RecRef.Open(DATABASE::"Bank Deposit Header");
            if BankDepositHeader.Get(DocumentAttachment."No.")then RecRef.GetTable(BankDepositHeader);
        end;
        database::"Posted Bank Deposit Header": begin
            RecRef.Open(DATABASE::"Posted Bank Deposit Header");
            if PostedBankDepositHeader.Get(DocumentAttachment."No.")then RecRef.GetTable(PostedBankDepositHeader);
        end;
        end;
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document Attachment Mgmt", OnAfterTableHasNumberFieldPrimaryKey, '', false, false)]
    local procedure OnAfterTableHasNumberFieldPrimaryKey(TableNo: Integer; var Result: Boolean; var FieldNo: Integer);
    begin
        if TableNo in[Database::"Bank Deposit Header", Database::"Posted Bank Deposit Header"]then begin
            FieldNo:=1;
            Result:=true;
        end;
    end;
/*
        [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
        local procedure OnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment"; var FlowFieldsEditable: Boolean; var RecRef: RecordRef)
        var
            FieldRef: FieldRef;
            RecNo: Code[20];
        begin
            case RecRef.Number of
                DATABASE::"Bank Deposit Header":
                    begin
                        FieldRef := RecRef.Field(1);
                        RecNo := FieldRef.Value;
                        DocumentAttachment.SetRange("No.", RecNo);

                        FlowFieldsEditable := false;
                    end;
            end;
        end;

        [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false, false)]
        local procedure OnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
        var
            FieldRef: FieldRef;
            RecNo: Code[20];
        begin
            case RecRef.Number of
                DATABASE::"Bank Deposit Header":
                    begin
                        FieldRef := RecRef.Field(1);
                        RecNo := FieldRef.Value;
                        DocumentAttachment.Validate("No.", RecNo);
                    end;
            end;
        end;
        */
}
