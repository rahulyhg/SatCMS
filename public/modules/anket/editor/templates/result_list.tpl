<h3>Результаты для анкеты 
&laquo;<a href="?m=anket&c=form">{$current.anket_form.title}</a>&raquo;</h3><br/><br/>
        
<table class="nice_borders" 
 rel="{$config.base_url}">

<tr class="nodrag">

<!--<a href="index.php?c={$g_c}&op=new"><img src="templates/images/b_new.gif" alt="" border="0"/></a>   
-->



<th>

#</a> 
</th> 

<th>Пользователь</th>  
<th>Баллы</th>
<th>Дата</th>  

<th nowrap="nowrap" width="50">{$lang.ops}</th>
</tr>

<TBODY id="{$req.c}_table">

<!-- {if $smarty.foreach.out.index is odd}class="row1"{/if} -->

                                       
{assign var="index_" value="0"}
{foreach key=i name=out item=item from=$tpl_anket_result}   

{* {$req.c}_item_ *}
    <tr rel="{$item.position}" rel_id="{$item.id}" id="{$req.c}_item_{$item.id}"
    {if $item.b_is_global}class="row_red"{else}{if $index_ is odd}class="row1"{/if}{/if}   >
      
    
    <td class="first">
    {$item.id}
    </td>    
    
    <td class="first">
    {$item.name|@escape} &nbsp;
    </td>    

    <td 
    class="{if $item.b_valid}backgreen{else}backred{/if}"
    >
    {$item.value|@escape} &nbsp;
    </td>    

    
    <td class="help">
    {$item.date} &nbsp;
    </td>   
               
     

    <td>

      <a class="dialog" href="index.php?m={$req.m}&c={$req.c}&do={$req.do}&op=edit&id={$item.id}&pid={$req.pid}&embed=yes"
            title="Изменение элемента" 
            dialog="{ldelim}width:930,height:630{rdelim}"
      >        
     <img src="{$config.site_url}editor/templates/images/b_edit.png" alt="" border="0"/>
     </a>    
       
    &nbsp;

    <a class="a_delete" href="index.php?m={$req.m}&c={$req.c}&do={$req.do}&op=drop&id={$item.id}&pid={$req.pid}"><img src="{$config.site_url}editor/templates/images/b_drop.png" alt="" border="0"/></a>
     
    </td>

    </tr>

{assign var="index_" value=$index_+1}
{foreachelse}

    <tr class="nodrag"><td colspan="5" style="padding:10px;text-align:center">
   {$lang.empty}
    </td></tr>   

{/foreach}

</TBODY>

</table>

 
{* pagination *}
{include file="pagination.tpl"} 