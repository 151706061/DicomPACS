select t.*, rowid from login.tapp t where upper(t.fc_fname) like '%.XSL';



Сразу после обработки Амбулаторной карты добавить обработку Амбулаторной карты ОНКО (пример см. ниже):


		<!--если документ АМБУЛАТОРНАЯ КАРТА-->
		<xsl:if test="@T='-1'">
			<!-- ../../@TYP=0 or-->
			<xsl:value-of disable-output-escaping="yes" select="EVSRES"/>
		</xsl:if>
		<!--если документ АМБУЛАТОРНАЯ КАРТА (ОНКО)-->
		<xsl:if test="@T='16'">
			<!-- ../../@TYP=0 or-->
			<xsl:value-of disable-output-escaping="yes" select="EVSRES"/>
		</xsl:if>    






