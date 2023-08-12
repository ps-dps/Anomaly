
function ~/create:
    $data merge storage ps:edb {s:{"$(UUID)":{}}}

function ~/load:
    $data modify storage ps:edb entity set from storage ps:edb s."$(UUID)"

function ~/save:
    $data modify storage ps:edb s."$(UUID)" set from storage ps:edb entity

function ~/delete:
    $data remove storage ps:edb s."$(UUID)"


function ~/zzz/delete_all:
    data remove storage ps:edb s
