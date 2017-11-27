{if $scriptolutionfileinfo.FID GT "0"}
{insert name=file_details value=a assign=fd fid=$scriptolutionfileinfo.FID}
{section name=x loop=$fd}
{insert name=gfs value=a assign=afs fid=$fd[x].FID}
<div class="padding5"></div>
<div class="files">
  <ul>
    <li><a href="{$baseurl}/files/{$fd[x].FID|md5}{$fd[x].s}/{$fd[x].fname}" target="_blank">{$fd[x].fname} <b>[{$afs}]</b></a></li>
  </ul>
</div>
{/section}
{/if}