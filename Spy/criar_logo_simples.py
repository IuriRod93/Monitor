#!/usr/bin/env python
import os
from pathlib import Path

def criar_logo_svg():
    # Criar diretório se não existir
    static_dir = Path('monitoramento/static/icons')
    static_dir.mkdir(parents=True, exist_ok=True)
    
    # Logo SVG simples
    svg_content = '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
    <defs>
        <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="100%">
            <stop offset="0%" style="stop-color:#667eea;stop-opacity:1" />
            <stop offset="100%" style="stop-color:#764ba2;stop-opacity:1" />
        </linearGradient>
    </defs>
    <circle cx="50" cy="50" r="45" fill="url(#grad1)" stroke="white" stroke-width="2"/>
    <text x="50" y="35" font-family="Arial, sans-serif" font-size="16" font-weight="bold" text-anchor="middle" fill="white">IROD</text>
    <text x="50" y="55" font-family="Arial, sans-serif" font-size="12" text-anchor="middle" fill="white">SPY</text>
    <circle cx="50" cy="70" r="3" fill="white" opacity="0.8"/>
    <circle cx="40" cy="70" r="2" fill="white" opacity="0.6"/>
    <circle cx="60" cy="70" r="2" fill="white" opacity="0.6"/>
</svg>'''
    
    # Salvar logo
    with open(static_dir / 'logo.svg', 'w') as f:
        f.write(svg_content)
    
    print(f"Logo SVG criada em: {static_dir / 'logo.svg'}")
    
    # Criar fallback HTML para logo
    logo_html = '''<div style="
        width: 80px; 
        height: 80px; 
        border-radius: 50%; 
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        color: white;
        font-weight: bold;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
    ">
        <div style="font-size: 16px;">IROD</div>
        <div style="font-size: 12px;">SPY</div>
    </div>'''
    
    print("Logo HTML fallback criado")
    print("Use este HTML se a imagem não carregar:")
    print(logo_html)

if __name__ == '__main__':
    criar_logo_svg()