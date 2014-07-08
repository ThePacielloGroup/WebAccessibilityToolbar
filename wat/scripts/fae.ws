function main(){
try{
formadd = WAT.document.createElement('form');
formadd.setAttribute('method', 'post');
formadd.setAttribute('action', 'http://fae.cita.uiuc.edu/evaluate/dhtml/');
formadd.setAttribute('id', 'fae');
formadd.innerHTML='<input type="hidden" name="url" value="'+WAT.document.location+'"><input type="hidden" name="report_title" value="FAE%20report%20from%20Web%20Accessibility%20Toolbar"><input type="hidden" name="num_docs" value="1"><input type="hidden" name="mode" value="ext"><input type="hidden" name="doc1" value="<!DOCTYPE html5>'+escape(WAT.document.documentElement.outerHTML)+'">';
WAT.document.body.appendChild(formadd);
WAT.document.getElementById('fae').submit();
}
catch(e){alert(localize('errortxt5'))}
}