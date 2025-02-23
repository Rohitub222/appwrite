<?php

namespace Appwrite\Tests;

use Appwrite\URL\URL;
use PHPUnit\Framework\TestCase;

class URLTest extends TestCase
{
    public function testParse()
    {
        $url = URL::parse('https://appwrite.io:8080/path?query=string&param=value');

        $this->assertIsArray($url);
        $this->assertEquals('https', $url['scheme']);
        $this->assertEquals('appwrite.io', $url['host']);
        $this->assertEquals('8080', $url['port']);
        $this->assertEquals('/path', $url['path']);
        $this->assertEquals('query=string&param=value', $url['query']);

        $url = URL::parse('https://appwrite.io');

        $this->assertIsArray($url);
        $this->assertEquals('https', $url['scheme']);
        $this->assertEquals('appwrite.io', $url['host']);
        $this->assertEquals(null, $url['port']);
        $this->assertEquals('', $url['path']);
        $this->assertEquals('', $url['query']);
    }

    public function testUnparse()
    {
        $url = URL::unparse([
            'scheme' => 'https',
            'host' => 'appwrite.io',
            'port' => 8080,
            'path' => '/path',
            'query' => 'query=string&param=value',
        ]);

        $this->assertIsString($url);
        $this->assertEquals('https://appwrite.io:8080/path?query=string&param=value', $url);

        $url = URL::unparse([
            'scheme' => 'https',
            'host' => 'appwrite.io',
            'port' => null,
            'path' => '/path',
            'query' => 'query=string&param=value',
        ]);

        $this->assertIsString($url);
        $this->assertEquals('https://appwrite.io/path?query=string&param=value', $url);

        $url = URL::unparse([
            'scheme' => 'https',
            'host' => 'appwrite.io',
            'port' => null,
            'path' => '',
            'query' => '',
        ]);

        $this->assertIsString($url);
        $this->assertEquals('https://appwrite.io/', $url);

        $url = URL::unparse([
            'scheme' => 'https',
            'host' => 'appwrite.io',
            'port' => null,
            'path' => '',
            'fragment' => 'bottom',
        ]);

        $this->assertIsString($url);
        $this->assertEquals('https://appwrite.io/#bottom', $url);

        $url = URL::unparse([
            'scheme' => 'https',
            'user' => 'eldad',
            'pass' => 'fux',
            'host' => 'appwrite.io',
            'port' => null,
            'path' => '',
            'fragment' => 'bottom',
        ]);

        $this->assertIsString($url);
        $this->assertEquals('https://eldad:fux@appwrite.io/#bottom', $url);
    }
}