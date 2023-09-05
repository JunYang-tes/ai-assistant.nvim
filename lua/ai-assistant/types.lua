local _local_1_ = require("ai-assistant.type-hint")
local String = _local_1_["String"]
local Number = _local_1_["Number"]
local Const = _local_1_["Const"]
local OneOf = _local_1_["OneOf"]
local Nil = _local_1_["Nil"]
local List = _local_1_["List"]
local Any = _local_1_["Any"]
local Map = _local_1_["Map"]
local Fn = _local_1_["Fn"]
local Void = _local_1_["Void"]
local Table = _local_1_["Table"]
local Role = OneOf(Const("ai"), Const("user"))
local MessageState = OneOf(Const("sending"), Const("sent"), Const("failed"))
local Message = Table({"state", MessageState, "id", Number, "role", Role, "content", String})
local OnNewMessage = Fn({Message}, Void)
local OnUpdateMessage = Fn({Message}, Void)
local Session = Table({"get-messages", Fn({}, List(Message)), "update-profile", Fn({}, Void), "set-handlers", Fn({OnNewMessage, OnUpdateMessage}, Void), "send-message", Fn({String}, Void)})
local Profile = Table({"init", Fn({}, String), "update", Fn({}, OneOf(String, Nil))})
return {Message = Message, Role = Role, Profile = Profile}
