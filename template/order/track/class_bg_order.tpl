<{$classBg=""}><{foreach $amount as $field => $number}><{if NULL === $number || !$standard[$field]}><{continue}><{/if}><{if ($standard[$field] * 1.5) <= $number}><{$classBg=' class="track-day-danger"'}><{break}><{/if}><{if ($standard[$field] * 1.3) <= $number && ($standard[$field] * 1.5) > $number}><{$classBg=' class="track-day-warnning"'}><{/if}><{/foreach}><{$classBg}> <{$field}>
