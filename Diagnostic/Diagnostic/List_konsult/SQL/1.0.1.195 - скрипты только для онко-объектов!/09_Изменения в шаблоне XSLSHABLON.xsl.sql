select t.*, rowid from login.tapp t where upper(t.fc_fname) like '%.XSL';



����� ����� ��������� ������������ ����� �������� ��������� ������������ ����� ���� (������ ��. ����):


		<!--���� �������� ������������ �����-->
		<xsl:if test="@T='-1'">
			<!-- ../../@TYP=0 or-->
			<xsl:value-of disable-output-escaping="yes" select="EVSRES"/>
		</xsl:if>
		<!--���� �������� ������������ ����� (����)-->
		<xsl:if test="@T='16'">
			<!-- ../../@TYP=0 or-->
			<xsl:value-of disable-output-escaping="yes" select="EVSRES"/>
		</xsl:if>    






